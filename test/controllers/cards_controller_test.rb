require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get board_cards_url(boards(:one))
    assert_response :success
  end

  test "should get new" do
    get new_board_card_path(boards(:one))
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post board_cards_url(boards(:one)), params: { card: { description: @card.description, status: @card.status, title: @card.title } }
    end

    assert_redirected_to board_url(boards(:one))
  end

  test "should show card" do
    get board_cards_url(@card.board, @card)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_card_url(@card.board, @card)
    assert_response :success
  end

  test "should update card" do
    patch board_card_url(@card.board, @card), params: { card: { description: @card.description  + "2", status: @card.status, title: @card.title + "2" } }
    assert_redirected_to board_url(@card.board)
  end

  test "should destroy card" do
    board = @card.board
    assert_difference('Card.count', -1) do
      delete board_card_url(@card.board, @card)
    end

    assert_redirected_to board_cards_url(board)
  end
end
