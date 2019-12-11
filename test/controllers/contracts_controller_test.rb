require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contract = contracts(:one)
  end

  test "should get index" do
    get contracts_url
    assert_response :success
  end

  test "should get new" do
    get new_contract_url
    assert_response :success
  end

  test "should create contract" do
    assert_difference('Contract.count') do
      post contracts_url, params: { contract: { authority_person_name: @contract.authority_person_name, authority_person_phone: @contract.authority_person_phone, bil_req_email: @contract.bil_req_email, bil_req_name: @contract.bil_req_name, bil_req_phone: @contract.bil_req_phone, contact_name: @contract.contact_name, contractor_name: @contract.contractor_name, date_submitted: @contract.date_submitted, email: @contract.email, full_name: @contract.full_name, gst: @contract.gst, legal_title: @contract.legal_title, mailing_address_id: @contract.mailing_address_id, password: @contract.password, remittance_address_id: @contract.remittance_address_id, serv_req_email: @contract.serv_req_email, serv_req_name: @contract.serv_req_name, serv_req_phone: @contract.serv_req_phone, telephone: @contract.telephone, title: @contract.title, type_work: @contract.type_work } }
    end

    assert_redirected_to contract_url(Contract.last)
  end

  test "should show contract" do
    get contract_url(@contract)
    assert_response :success
  end

  test "should get edit" do
    get edit_contract_url(@contract)
    assert_response :success
  end

  test "should update contract" do
    patch contract_url(@contract), params: { contract: { authority_person_name: @contract.authority_person_name, authority_person_phone: @contract.authority_person_phone, bil_req_email: @contract.bil_req_email, bil_req_name: @contract.bil_req_name, bil_req_phone: @contract.bil_req_phone, contact_name: @contract.contact_name, contractor_name: @contract.contractor_name, date_submitted: @contract.date_submitted, email: @contract.email, full_name: @contract.full_name, gst: @contract.gst, legal_title: @contract.legal_title, mailing_address_id: @contract.mailing_address_id, password: @contract.password, remittance_address_id: @contract.remittance_address_id, serv_req_email: @contract.serv_req_email, serv_req_name: @contract.serv_req_name, serv_req_phone: @contract.serv_req_phone, telephone: @contract.telephone, title: @contract.title, type_work: @contract.type_work } }
    assert_redirected_to contract_url(@contract)
  end

  test "should destroy contract" do
    assert_difference('Contract.count', -1) do
      delete contract_url(@contract)
    end

    assert_redirected_to contracts_url
  end
end
