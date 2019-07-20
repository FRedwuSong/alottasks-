require "rails_helper"

RSpec.feature "Task CRUD", :type => :feature do
  scenario "User creates a new task" do
    visit "/tasks/new"

    fill_in "task_title", :with => "title"
    fill_in "task_content", :with => "content"
    click_button "Create Task"

    expect(page).to have_text(I18n.t('tasks.create.notice'))
  end
  scenario "User updates a task" do
    @task = FactoryBot.create(:task)
    visit "/tasks/#{@task.id}/edit"

    fill_in "task_title", :with => "update_title"
    fill_in "task_content", :with => "update_content"
    click_button "Update Task"

    expect(page).to have_text(I18n.t('tasks.update.notice'))
  end
end