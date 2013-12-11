chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'schneier', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/schneier')(@robot)

  #it 'registers a respond listener', ->
  #  expect(@robot.respond).to.have.been.calledWith(/schneier|bruce/i)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/schneier|bruce/i)