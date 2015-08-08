request = require "superagent"

class RetroAchievements

  @baseUrl = "http://retroachievements.org/API/"

  constructor: (@user, @apiKey) ->

  api: (path, params = {}, callback) ->
    params["z"] = @user
    params["y"] = @apiKey

    request
      .get RetroAchievements.baseUrl + path
      .query params
      .type "application/json"
      .accept "application/json"
      .end (err, res) ->
        callback err, JSON.parse res.text || {}

  topTenUsers: (callback) ->
    @api "API_GetTopTenUsers.php", null, callback

  consoles: (callback) ->
    @api "API_GetConsoleIDs.php", null, callback

  gameList: (console, callback) ->
    @api "API_GetGameList.php", {i: console}, callback

  gameInfo: (game, callback) ->
    @api "API_GetGame.php", {i: game}, callback

  gameInfoExtended: (game, callback) ->
    @api "API_GetGameExtended.php", {i: game}, callback

  gameInfoAndUserProgress: (user, game, callback) ->
    @api "API_GetGameInfoAndUserProgress.php", {u: user, g: game}, callback

  userRankAndScore: (user, callback) ->
    @api "API_GetUserRankAndScore.php", {u: user}, callback

  userRecentlyPlayedGames: (user, count, offset, callback) ->
    @api "API_GetUserRecentlyPlayedGames.php", {u: user, c: count, o: offset}, callback

  userProgress: (user, games, callback) ->
    games = games.join "," if games instanceof Array

    @api "API_GetUserProgress.php", {u: user, i: games}, callback

  userSummary: (user, recentGames, callback) ->
    @api "API_GetUserSummary.php", {u: user, i: recentGames, a: 5}, callback

  feedFor: (user, recentActivities, callback) ->
    @api "API_GetFeed.php", {u: user, i: recentActivities}, callback

  achievementsEarnedOnDay: (user, date, callback) ->
    @api "API_GetAchievementsEarnedOnDay.php", {u: user, d: date}, callback

  achievementsEarnedBetween: (user, start, end, callback) ->
    start = Math.floor(start.getTime() / 1000) if start instanceof Date
    end = Math.floor(end.getTime() / 1000) if end instanceof Date

    @api "API_GetAchievementsEarnedBetween.php", {u: user, f: start, t: end}, callback

module.exports = RetroAchievements
