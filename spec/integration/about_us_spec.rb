# -*- coding: utf-8 -*-

require 'spec_helper'

describe 'about us page related functions', type: :feature do

  context 'visit about us page' do

    before{ visit '/about-us' }

    it 'should visit about us page' do
      page.should have_content('你好，我们是开放课堂')
    end

  end

end