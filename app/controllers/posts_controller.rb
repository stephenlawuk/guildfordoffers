class PostsController < ApplicationController

  before_filter :require_user, :only => [:new, :list, :create, :edit, :update, :destroy]
  before_filter :getlocation

  # unused currently unable to call from view
  def incprintcount
    @post = Post.find(params[:id])
    if @post.printcount.blank?
      @post.update_attribute(:printcount, "1")
      @post.save
    else
      @post.update_attribute(:printcount, @post.printcount + 1)
      @post.save
    end
  end

  # go to app controller to change ip while on local host
  def getlocation
    @myip = remote_ip()
    # based off freegeoip.net is really terrible
    result = Geocoder.search(@myip)
    @mylat = result.latitude
    @mylong = result.longitude
    @mycity = result.address
    #51.243048, -0.588458
  end

  # GET /posts
  # GET /posts.xml
  def index
    # @posts = Post.all(:order => "created_at DESC")
    @posts = Post.paginate :page => params[:page], :per_page => 24, :order => "created_at DESC"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts
  # GET /posts.xml
  def search
    @search = Post.search(params[:search].split(' '))
    @posts = @search.all
    @posts = @search.paginate :page => params[:page], :per_page => 24, :order => "created_at DESC"
    @posts_count = @search.count
   # @search = Post.offer_like_any(params[:search])
   # @posts = @search.all.paginate :page => params[:page], :per_page => 24, :order => "created_at DESC"
   # @posts = Post.offer_like_any(params[:search].to_s.split).paginate :page => params[:page], :per_page => 24, :order => "created_at DESC"
   # @posts = Post.company_like_any(params[:search].to_s.split).paginate :page => params[:page], :per_page => 24, :order => "created_at DESC"
   respond_to do |format|
      format.html # search.html.erb
      format.xml  { render :xml => @posts }
   end
  end

  # GET /posts
  # GET /posts.xml
  def list
    @posts = Post.paginate :page => params[:page], :per_page => 24, :order => "created_at DESC"

    respond_to do |format|

      format.html # list.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])

    unless @post.latitude.blank? or @post.longitude.blank?
      @marker = GMarker.new([@post.latitude,@post.longitude],:title => @post.company, :info_window => @post.offer)
      @myloc = GMarker.new([@mylat,@mylong],:title => "You", :info_window => "You Are Here At #@mylat, #@mylong")

      @map = GMap.new("map")
      @map.control_init(:large_map => true,:map_type => true)
      @map.set_map_type_init(GMapType::G_HYBRID_MAP)
      @map.center_zoom_init([@post.latitude,@post.longitude],17)
      @map.overlay_init(@marker)
      @map.overlay_init(@myloc)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  # RSS feed
  def feed
    @posts = Post.all(:select => "id, offer, description, company, imgurl, created_at", :order => "created_at DESC", :limit => 24)

    respond_to do |format|
      format.rss { render :layout => false } #index.rss.builder
    end
  end

end
