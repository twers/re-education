# -*- coding: utf-8 -*-

require 'spec_helper'

describe 'Feedback ralate functions', type: :feature do

  context 'send a feedback' do

    before { visit '/feedbacks/new' }

    it 'should visit feedback new page' do
      page.should have_content('我有一些建议')
    end

    context 'do not input any thing' do

      before { click_button('提交反馈') }

      it 'should redirect to back and alert the user' do
        page.should have_content('请不要犹豫')
      end

    end

    context 'input required fields' do

      before do
        fill_in 'feedback_email', with: 'test@example.com'
        fill_in 'feedback_body', with: 'This is feedback body'
        click_button('提交反馈')
      end

      it 'should redirect to the thanks page' do
        page.should have_content('谢谢您的建议')
      end

    end

  end

end