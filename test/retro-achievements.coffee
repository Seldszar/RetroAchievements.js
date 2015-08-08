assert = require "assert"
RetroAchievements = require "../src/retro-achievements"

describe "RetroAchievements.js", ->
  ra = new RetroAchievements "RAUserName", "c7oMBrloXk1fDBjxlJrpsNh6B7NpcGkf"

  describe "#topTenUsers()", ->
    it "should return top ten users", (done) ->
      ra.topTenUsers (err, data) ->
        done err

  describe "#consoles()", ->
    it "should return consoles", (done) ->
      ra.consoles (err, data) ->
        done err

  describe "#gameList()", ->
    it "should return Super Nintendo game list", (done) ->
      ra.gameList 3, (err, data) ->
        done err

  describe "#gameInfo()", ->
    it "should return Super Mario RPG: Legend of the Seven Stars game informations", (done) ->
      ra.gameInfo 471, (err, data) ->
        done err

  describe "#gameInfoExtended()", ->
    it "should return Super Mario RPG: Legend of the Seven Stars extended game informations", (done) ->
      ra.gameInfoExtended 471, (err, data) ->
        done err

  describe "#gameInfoAndUserProgress()", ->
    it "should return Super Mario RPG: Legend of the Seven Stars game informations with RAUserName progress", (done) ->
      ra.gameInfoAndUserProgress "RAUserName", 471, (err, data) ->
        done err

  describe "#userRankAndScore()", ->
    it "should return RAUserName rank and score", (done) ->
      ra.userRankAndScore "RAUserName", (err, data) ->
        done err

  describe "#userRecentlyPlayedGames()", ->
    it "should return RAUserName recently played games", (done) ->
      ra.userRecentlyPlayedGames "RAUserName", 3, 0, (err, data) ->
        done err

  describe "#userProgress()", ->
    it "should return RAUserName progress", (done) ->
      ra.userProgress "RAUserName", [471], (err, data) ->
        done err

  describe "#userSummary()", ->
    it "should return RAUserName summary", (done) ->
      ra.userSummary "RAUserName", 471, (err, data) ->
        done err

  describe "#feedFor()", ->
    it "should return RAUserName feed", (done) ->
      ra.feedFor "RAUserName", 5, (err, data) ->
        done err

  describe "#achievementsEarnedOnDay()", ->
    it "should return RAUserName achievements earned on 2013-06-15", (done) ->
      ra.achievementsEarnedOnDay "RAUserName", "2013-06-15", (err, data) ->
        done err

  describe "#achievementsEarnedBetween()", ->
    it "should return RAUserName achievements earned between 2014-06-15 and 2014-07-15", (done) ->
      ra.achievementsEarnedBetween "RAUserName", new Date(2014, 6, 15), new Date(2014, 7, 15), (err, data) ->
        done err
