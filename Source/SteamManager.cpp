#include "Globals.h"

using namespace std;

SteamManager::SteamManager() :
   m_CallbackUserStatsReceived(this, &SteamManager::OnUserStatsReceived),
   m_CallbackUserStatsStored(this, &SteamManager::OnUserStatsStored),
   m_CallbackAchievementStored(this, &SteamManager::OnAchievementStored),
   m_CallbackOverlayChanged(this, &SteamManager::OnGameOverlayChanged)
{
   m_iAppID = 0;
   m_bInitialized = false;
   m_CurrentLeaderboard = 0;
   m_nLeaderboardEntries = 0;

   for (int i = 0; i < 10; ++i)
   {
      m_LeaderboardEntryData.push_back(std::vector<int>{});
   }
}

void SteamManager::Init(const std::string& configfile)
{
#ifdef STEAM_BUILD
   if (SteamAPI_RestartAppIfNecessary(834760))
#else
   if (SteamAPI_RestartAppIfNecessary(k_uAppIdInvalid))
#endif
   {
      throw("Steam was not running when the game was started; the game must now relaunch.");
   }

   if (!SteamAPI_Init())
   {
      throw("The Steam client is required to play this game.");
   }
}

void SteamManager::OnGameOverlayChanged(GameOverlayActivated_t *callback)
{
   m_IsSteamOverlayUp = callback->m_bActive;
}

void SteamManager::SetupAchievements(SteamAchievement_t *Achievements, int NumAchievements)
{
   m_bInitialized = true;
   m_iAppID = SteamUtils()->GetAppID();
   //m_pAchievements = Achievements;
  // m_iNumAchievements = NumAchievements;
   
   RequestStats();
}

void SteamManager::Shutdown()
{
   SteamAPI_Shutdown();
}

void SteamManager::Update()
{
   SteamAPI_RunCallbacks();
}

bool SteamManager::SetAchievement(const char* ID)
{
   // Have we received a call back from Steam yet?
   if (m_bInitialized)
   {
      SteamUserStats()->SetAchievement(ID);
      return SteamUserStats()->StoreStats();
   }
   // If not then we can't set achievements yet
   return false;
}

bool SteamManager::RequestStats()
{
   // Is Steam loaded? If not we can't get stats.
   if (NULL == SteamUserStats() || NULL == SteamUser())
   {
      return false;
   }

   // Is the user logged on?  If not we can't get stats.
   if (!SteamUser()->BLoggedOn())
   {
      return false;
   }

   // Request user stats.

   return SteamUserStats()->RequestCurrentStats();
}

void SteamManager::OnUserStatsReceived(UserStatsReceived_t *pCallback)
{
   // we may get callbacks for other games' stats arriving, ignore them
   if ( m_iAppID == pCallback->m_nGameID )
   {
      if ( k_EResultOK == pCallback->m_eResult )
      {
         Log("Received stats and achievements from Steam.");
         m_bInitialized = true;
         // load achievements
         /*for ( int iAch = 0; iAch < m_iNumAchievements; ++iAch )
         {
            SteamAchievement_t &ach = m_pAchievements[iAch];
            SteamUserStats()->GetAchievement(ach.m_pchAchievementID, &ach.m_bAchieved);
            _snprintf( ach.m_rgchName, sizeof(ach.m_rgchName), "%s", SteamUserStats()->GetAchievementDisplayAttribute(ach.m_pchAchievementID, "name"));
            _snprintf( ach.m_rgchDescription, sizeof(ach.m_rgchDescription), "%s", SteamUserStats()->GetAchievementDisplayAttribute(ach.m_pchAchievementID, "desc"));
         }*/
      }
      else
      {
         char buffer[128];
         _snprintf( buffer, 128, "RequestStats - failed, %d\n", pCallback->m_eResult );
         Log( buffer );
      }
   }
}

void SteamManager::OnUserStatsStored(UserStatsStored_t *pCallback)
{
   // we may get callbacks for other games' stats arriving, ignore them
   if ( m_iAppID == pCallback->m_nGameID )
   {
      if ( k_EResultOK == pCallback->m_eResult )
      {
         Log( "Stored stats for Steam" );
      }
      else
      {
         char buffer[128];
         _snprintf( buffer, 128, "StatsStored - failed, %d\n", pCallback->m_eResult );
         Log( buffer );
      }
   }
}

void SteamManager::OnAchievementStored(UserAchievementStored_t *pCallback)
{
   // we may get callbacks for other games' stats arriving, ignore them
   if ( m_iAppID == pCallback->m_nGameID )
   {
      Log( "Stored Achievement for Steam" );
   }
}


// Leaderboards
bool SteamManager::FindLeaderboard(const char *pchLeaderboardName)
{
   Log("Searching for leaderboard " + string(pchLeaderboardName));
   if (m_FindLeaderboardPending)
      return false; // We're already looking up a leaderboard, fuck off with your new request
   m_FindLeaderboardPending = true;
   m_CurrentLeaderboard = 0;
   SteamAPICall_t hSteamAPICall = SteamUserStats()->FindLeaderboard(pchLeaderboardName);
   if (hSteamAPICall != 0)
   {
      m_CallResultFindLeaderboard.Set(hSteamAPICall, this, &SteamManager::OnFindLeaderboard);
   }
   m_PotentialLeaderboardName = string(pchLeaderboardName);
   return true; // We started finding a new leaderboard
}

void SteamManager::OnFindLeaderboard(LeaderboardFindResult_t *pCallback, bool bIOFailure)
{
   // see if we encountered an error during the call
   if (!pCallback->m_bLeaderboardFound || bIOFailure)
   {
      Log("Leaderboard could not be found.");
//      OutputDebugString(L"Leaderboard could not be found\n");
      return;
   }
   Log("Leaderboard found.");
   m_CurrentLeaderboard = pCallback->m_hSteamLeaderboard;
   m_CurrentLeaderboardName = m_PotentialLeaderboardName;
   m_FindLeaderboardPending = false;
   m_DownloadScoresNeeded = true; // The current local scoreboard is NOW OUT OF DATE.
}

bool SteamManager::UploadScore(int score, std::vector<int> data)
{
#ifdef _DEBUG //  We cannot upload scores to Steam leaderboards in debug, because debug allows cheats.
   return false;
#endif
   if (!m_CurrentLeaderboard) return false;
   SteamAPICall_t hSteamAPICall;
   if(data.size() == 0)
      hSteamAPICall = SteamUserStats()->UploadLeaderboardScore(m_CurrentLeaderboard, k_ELeaderboardUploadScoreMethodKeepBest, score, NULL, 0);
   else
      hSteamAPICall = SteamUserStats()->UploadLeaderboardScore(m_CurrentLeaderboard, k_ELeaderboardUploadScoreMethodKeepBest, score, data.data(), (int)data.size());
   m_CallResultUploadScore.Set(hSteamAPICall, this, &SteamManager::OnUploadScore);
   return true;
}

void SteamManager::OnUploadScore(LeaderboardScoreUploaded_t *pCallback, bool bIOFailure)
{
   if (!pCallback->m_bSuccess || bIOFailure)
   {
//      OutputDebugString(L"Score could not be uploaded to Steam\n");
   }
}

bool SteamManager::DownloadScores(int location)
{
   if (!m_CurrentLeaderboard) return false; //  You didn't call FindLeaderboard() first.
   if (!m_DownloadScoresNeeded)
   {
      return true; // The scoreboard is current, no need to redownload
   }
   else // We're changing leaderboards, get the new leaderboard scores
   {
      if (!m_DownloadScoresPending) //  We've already got a request pending but it hasn't come back yet.
      {
         // load the specified leaderboard data around the current user
         SteamAPICall_t hSteamAPICall = SteamUserStats()->DownloadLeaderboardEntries(m_CurrentLeaderboard, ELeaderboardDataRequest(location), -4, 5);
         m_CallResultDownloadScore.Set(hSteamAPICall, this, &SteamManager::OnDownloadScore);
         m_DownloadScoresPending = true;
      }
      return false; // Either way, the scoreboard is STILL out of date, return false.
   }
}

void SteamManager::OnDownloadScore(LeaderboardScoresDownloaded_t *pCallback, bool bIOFailure)
{
   int  details[1];
   int  count = 1;
   if (!bIOFailure)
   {
      m_nLeaderboardEntries = 10;
      if (pCallback->m_cEntryCount < 10)
         m_nLeaderboardEntries = pCallback->m_cEntryCount;
      for (int index = 0; index < m_nLeaderboardEntries; index++)
      {
         SteamUserStats()->GetDownloadedLeaderboardEntry(pCallback->m_hSteamLeaderboardEntries, index, &m_LeaderboardEntries[index], details, count);
         //  Save the user data so we can access it later.
         m_LeaderboardEntryData[index].clear();
         for (int i = 0; i < count; ++i)
         {
            m_LeaderboardEntryData[index].emplace_back(details[i]);
         }
      }

      //  At last!  The scoreboard is back in date!
      m_DownloadScoresPending = false;
      m_DownloadScoresNeeded = false;
   }
}

vector<int> SteamManager::GetLeaderboardEntryData(int pos)
{
   return m_LeaderboardEntryData[pos];
}

LeaderboardEntry_t* SteamManager::GetLeaderboardEntry(int pos)
{
   if (pos < m_nLeaderboardEntries && pos>=0)
   {
      return &m_LeaderboardEntries[pos];
   }
   else
      return nullptr;
}

//  Returns the actual steam name from this leaderboard entry.
string SteamManager::GetLeaderboardEntryName(int pos)
{
   if (pos < m_nLeaderboardEntries)
   {
      return string(SteamFriends()->GetFriendPersonaName(m_LeaderboardEntries[pos].m_steamIDUser));
   }
   else
   {
      return string("");
   }
}

string SteamManager::GetLocalUserName()
{
   return string(SteamFriends()->GetPersonaName());
}

void SteamManager::CreateLeaderboard(const char *pchLeaderboardName, ELeaderboardSortMethod eLeaderboardSortMethod, ELeaderboardDisplayType eLeaderboardDisplayType)
{
   m_CurrentLeaderboard = 0;
   SteamAPICall_t hSteamAPICall = SteamUserStats()->FindOrCreateLeaderboard(pchLeaderboardName, eLeaderboardSortMethod, eLeaderboardDisplayType);
   if (hSteamAPICall != 0)
   {
      m_CallResultFindLeaderboard.Set(hSteamAPICall, this, &SteamManager::OnFindLeaderboard);
   }
}