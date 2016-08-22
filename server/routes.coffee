"use strict"
testController = require './controllers/test_controller'

module.exports = (app, router) ->
  app.use "/api/v1", router

  app.get "/", (req, res) ->
    res.status(200).send "omg-css API"

  # Middleware for router
  router.use (req, res, next)->
    # visualize requests in terminal
    console.log('Making a ' + req.method + ' request to ' + req.url)
    next()

  # Test Route
  router.get "/test", (req, res) ->
    testController.get(req, res)

  router.post "/test", (req, res) ->
    testController.post(req, res)

  #router.get "/test/:test_id", (req, res) ->
    #testController.getTest(req, res)

