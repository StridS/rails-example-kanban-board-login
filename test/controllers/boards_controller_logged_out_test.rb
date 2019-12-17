require 'test_helper'

class BoardsControllerLoggedOutTest < ActionDispatch::IntegrationTest
  setup do
    @board = boards(:one)
  end

  test "should get index" do
    get boards_url
    assert_response :success
  end

  test "should show board" do
    get board_url(@board)
    assert_response :success
  end    

  test "should not get new" do
    get new_board_url
    assert_redirected_to boards_url
  end

  test "should not create board" do
    assert_difference('Board.count', 0) do
      post boards_url, params: { board: { title: @board.title } }
    end
    assert_redirected_to boards_url
  end

  test "should notget edit" do
    get edit_board_url(@board)
    assert_redirected_to boards_url
  end

  test "should not update board" do
    patch board_url(@board), params: { board: { title: @board.title } }
    assert_redirected_to boards_url
  end

  test "should destroy board" do
    assert_difference('Board.count', 0) do
      delete board_url(@board)
    end
    assert_redirected_to boards_url
  end
end
