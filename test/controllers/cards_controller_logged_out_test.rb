require 'test_helper'

class CardsControllerLoggedOutTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
    @board = boards( :one)
  end

  test "should get new" do
    get new_board_card_path(@board)
    assert_redirected_to new_user_session_url
  end

  test "should not create card" do
    assert_difference('Card.count', 0) do
      post board_cards_url(@board), params: { card: { description: @card.description, status: @card.status, title: @card.title } }
    end

    assert_redirected_to new_user_session_url
  end

  test "should not get edit" do
    get edit_board_card_url(@card.board, @card)
    assert_redirected_to new_user_session_url
  end

  test "should not update card" do
    patch board_card_url(@card.board, @card), params: { card: { description: @card.description  + "2", status: @card.status, title: @card.title + "2" } }
    assert_redirected_to new_user_session_url
  end

  test "should not destroy card" do
    board = @card.board
    assert_difference('Card.count', 0) do
      delete board_card_url(@card.board, @card)
    end

    assert_redirected_to new_user_session_url
  end

end