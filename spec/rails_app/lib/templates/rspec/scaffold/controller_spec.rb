require 'spec_helper'

describe <%= controller_class_name %>Controller do
<% unless options[:singleton] -%>
  describe 'index action' do
    it 'should be successful' do
      get :index
      assigns(:<%= table_name %>).should be_an(Array)
      response.should be_success
    end
  end

<% end -%>
  describe 'show action' do
    it 'should be successful' do
      get :show, 
        :id => <%= table_name %>(:one).id
      assigns(:<%= file_name %>).should be_a(<%= class_name %>)
    end
  end

  describe 'new action' do
    it 'should be successful' do
      get :new
      assigns(:<%= file_name %>).should be_a(<%= class_name %>)
    end
  end

  describe 'edit action' do
    it 'should be successful' do
      get :edit, 
        :id => <%= table_name %>(:one).id
      assigns(:<%= file_name %>).should be_a(<%= class_name %>)
    end
  end

  describe 'create action' do
    it 'should be successful' do
      <%= class_name %>.any_instance.expects(:valid?).returns(true)
      post :create
      assigns(:<%= file_name %>).should_not be_new_record
      response.should be_redirect
    end

    it 'should render new template if unsuccessful' do
      <%= class_name %>.any_instance.expects(:valid?).returns(false)
      post :create
      assigns(:<%= file_name %>).should be_new_record
      response.should render_template('<%= table_name %>/new')
    end
  end

  describe 'update action' do
    it 'should be successful' do
      <%= class_name %>.any_instance.expects(:valid?).returns(true)
      put :update, 
        :id => <%= table_name %>(:one).id
      response.should be_redirect
    end

    it 'should render edit template if unsuccessful' do
      <%= class_name %>.any_instance.expects(:valid?).returns(false)
      put :update, 
        :id => <%= table_name %>(:one).id
      response.should render_template('<%= table_name %>/edit')
    end
  end

  describe 'destroy action' do
    it 'should be successful' do
      <%= class_name %>.any_instance.expects(:destroy)
      delete 'destroy',
        :id => <%= table_name %>(:one).id
      response.should redirect_to(<%= table_name %>_url)
    end
  end
end
