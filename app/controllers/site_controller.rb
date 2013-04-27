class SiteController < ApplicationController
  def about
  end

  def sitemap
    #headers['Content-Type'] = 'application/xml'
    @lessonplans = Lessonplan.all
    @last_modify = Lessonplan.order('updated_at').last.updated_at

    render :layout => false, :formats => :xml
  end

end
