require 'test_helper'

class ProjectTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_task = project_tasks(:one)
  end

  test "should get index" do
    get project_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_project_task_url
    assert_response :success
  end

  test "should create project_task" do
    assert_difference('ProjectTask.count') do
      post project_tasks_url, params: { project_task: { active: @project_task.active, address: @project_task.address, description: @project_task.description, name: @project_task.name, type: @project_task.type } }
    end

    assert_redirected_to project_task_url(ProjectTask.last)
  end

  test "should show project_task" do
    get project_task_url(@project_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_task_url(@project_task)
    assert_response :success
  end

  test "should update project_task" do
    patch project_task_url(@project_task), params: { project_task: { active: @project_task.active, address: @project_task.address, description: @project_task.description, name: @project_task.name, type: @project_task.type } }
    assert_redirected_to project_task_url(@project_task)
  end

  test "should destroy project_task" do
    assert_difference('ProjectTask.count', -1) do
      delete project_task_url(@project_task)
    end

    assert_redirected_to project_tasks_url
  end
end
