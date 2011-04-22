class PagesController < ApplicationController

  before_filter :require_user, :only => [:controlpanel]

  def about
    respond_to do |format|
      format.html # about.html.erb
      format.xml  { render :xml => @page }
    end
  end
 
  def contact
    respond_to do |format|
      format.html # contact.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def faq
    respond_to do |format|
      format.html # faq.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def partners
    respond_to do |format|
      format.html # partners.html.erb
      format.xml  { render :xml => @page }
    end
  end

  def controlpanel
    respond_to do |format|
      format.html # controlpanel.html.erb
      format.xml  { render :xml => @page }
    end
  end
end
