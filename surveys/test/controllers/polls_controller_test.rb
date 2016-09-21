require 'test_helper'

class PollsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poll = polls(:one)
  end

  test "should get index" do
    get polls_url, as: :json
    assert_response :success
  end

  test "should create poll" do
    assert_difference('Poll.count') do
      post polls_url, params: { poll: { description: @poll.description, options: @poll.options, title: @poll.title } }, as: :json
    end

    assert_response 201
  end

  test "should show poll" do
    get poll_url(@poll), as: :json
    assert_response :success
  end

  test "should update poll" do
    patch poll_url(@poll), params: { poll: { description: @poll.description, options: @poll.options, title: @poll.title } }, as: :json
    assert_response 200
  end

  test "should destroy poll" do
    assert_difference('Poll.count', -1) do
      delete poll_url(@poll), as: :json
    end

    assert_response 204
  end
end
