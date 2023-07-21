///////////////////////////////////////////////////////////////////////////
//
// Name:     STEAMMANAGER.H
// Author:   Anthony Salter
// Date:     2/03/05
// Purpose:  The SteamManager subsystem.
//
///////////////////////////////////////////////////////////////////////////

#ifndef _STEAMMANAGER_H_
#define _STEAMMANAGER_H_

#include "Object.h"
#include "steam_api.h"
#include "isteamuserstats.h"

#define _ACH_ID( id, name ) { id, #id, name, "", 0, 0 }

struct SteamAchievement_t
{
   int m_eAchievementID;
   const char *m_pchAchievementID;
   char m_rgchName[128];
   char m_rgchDescription[256];
   bool m_bAchieved;
   int m_iIconImage;
};

class SteamManager : public Object
{
   int64 m_iAppID; // Our current AppID
   SteamAchievement_t *m_pAchievements; // Achievements data
   int m_iNumAchievements; // The number of Achievements
   bool m_bInitialized; // Have we called Request stats and received the callback?
   
   //  Leaderboards
   SteamLeaderboard_t m_PotentialLeaderboard;
   SteamLeaderboard_t m_CurrentLeaderboard;
   int m_nLeaderboardEntries; // How many entries do we have?
   LeaderboardEntry_t m_LeaderboardEntries[10]; // The entries

   //  Callbacks
   STEAM_CALLBACK(SteamManager, OnUserStatsReceived, UserStatsReceived_t, m_CallbackUserStatsReceived);
   STEAM_CALLBACK(SteamManager, OnUserStatsStored, UserStatsStored_t, m_CallbackUserStatsStored);
   STEAM_CALLBACK(SteamManager, OnAchievementStored, UserAchievementStored_t, m_CallbackAchievementStored);
   STEAM_CALLBACK(SteamManager, OnGameOverlayChanged, GameOverlayActivated_t, m_CallbackOverlayChanged);

   // Called when SteamUserStats()->FindOrCreateLeaderboard() returns asynchronously
   void OnFindLeaderboard(LeaderboardFindResult_t *pResult, bool bIOFailure);
   CCallResult<SteamManager, LeaderboardFindResult_t> m_CallResultFindLeaderboard;

   // Called when SteamUserStats()->UploadLeaderboardScore() returns asynchronously
   void OnUploadScore(LeaderboardScoreUploaded_t *pResult, bool bIOFailure);
   CCallResult<SteamManager, LeaderboardScoreUploaded_t> m_CallResultUploadScore;

   void OnDownloadScore(LeaderboardScoresDownloaded_t *pResult, bool bIOFailure);
   CCallResult<SteamManager, LeaderboardScoresDownloaded_t> m_CallResultDownloadScore;

   std::string m_PotentialLeaderboardName = "";
   std::string m_CurrentLeaderboardName = ""; // The name of the leaderboard we last successfully requested.

   bool m_FindLeaderboardPending = false;
   bool m_DownloadScoresNeeded = false;
   bool m_DownloadScoresPending = false;

   bool m_IsSteamOverlayUp = false;

public:
   SteamManager();

   virtual void Init(const std::string& configfile);
           void SetupAchievements(SteamAchievement_t *Achievements, int NumAchievements);
   virtual void Shutdown();
   virtual void Update();
   virtual void Draw() {};

   //  Achievements
   bool RequestStats();
   bool SetAchievement(const char* ID);
   
   //  Leaderboards
   bool                FindLeaderboard(const char *pchLeaderboardName);
   void                CreateLeaderboard(const char *pchLeaderboardName, ELeaderboardSortMethod eLeaderboardSortMethod, ELeaderboardDisplayType eLeaderboardDisplayType);
   std::string         GetLeaderboardName() { return m_CurrentLeaderboardName; }
   bool                UploadScore(int score, std::vector<int> data = std::vector<int>{});
   bool                DownloadScores(int location = LBL_FRIENDSONLY); // Download scores for the currently selected leaderboard.  If you're getting no entries, it's because you haven't called FindLeaderboard() yet, or it hasn't returned yet.  Check the status of m_CurrentLeaderboardName.
   LeaderboardEntry_t* GetLeaderboardEntry(int pos);
   std::string         GetLeaderboardEntryName(int pos);
   std::vector<int>    GetLeaderboardEntryData(int pos);
   int                 GetNumberOfLeaderboardEntries() { return m_nLeaderboardEntries; }
   std::string         GetLocalUserName();
   bool                IsSteamOverlayUp() { return m_IsSteamOverlayUp; }

   std::vector < std::vector<int>> m_LeaderboardEntryData;

   enum LeaderboardLocations
   {
      LBL_GLOBAL = k_ELeaderboardDataRequestGlobal,
      LBL_FRIENDSONLY = k_ELeaderboardDataRequestFriends
   };
};

#endif