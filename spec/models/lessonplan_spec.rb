# == Schema Information
#
# Table name: lessonplans
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  content           :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  short_description :string(255)
#  symbol_img_url    :string(255)
#  attachment        :string(255)
#  user_id           :integer
#  publisher_id      :integer
#

require 'spec_helper'

describe Lessonplan do

  describe "#create_tasks" do
    let(:publisher) { FactoryGirl.create(:publisher) }
    let(:plan) { FactoryGirl.create(:lessonplan, publisher: publisher) }
    let(:task) { {title: '123', content: '321'} }
    let(:tasks) { [task, task] }

    it do
      expect do
        plan.create_tasks(tasks)
      end.to change(Task, :count).by(2)
    end
  end
end
