require 'test_helper'

class SquiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squire = squires(:one)
  end

  test "should get index" do
    get squires_url
    assert_response :success
  end

  test "should get new" do
    get new_squire_url
    assert_response :success
  end

  test "should create squire" do
    assert_difference('Squire.count') do
      post squires_url, params: { squire: { description: @squire.description, title: @squire.title } }
    end

    assert_redirected_to squire_url(Squire.last)
  end

  test "should show squire" do
    get squire_url(@squire)
    assert_response :success
  end

  test "should get edit" do
    get edit_squire_url(@squire)
    assert_response :success
  end

  test "should update squire" do
    patch squire_url(@squire), params: { squire: { description: @squire.description, title: @squire.title } }
    assert_redirected_to squire_url(@squire)
  end

  test "should destroy squire" do
    assert_difference('Squire.count', -1) do
      delete squire_url(@squire)
    end

    assert_redirected_to squires_url
  end
end
