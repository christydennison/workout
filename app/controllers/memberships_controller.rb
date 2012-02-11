class MembershipsController < ApplicationController
  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @memberships }
    end
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @membership = Membership.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @membership }
    end
  end

  # GET /memberships/new
  # GET /memberships/new.json
  def new
    @membership = Membership.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @membership }
    end
  end

  # GET /memberships/1/edit
  def edit
    @membership = Membership.find(params[:id])
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @event = Event.find params[:event_id]  # Passing in event id from view
    #current_user = User.find params[:user_id]
    @membership = @event.add_membership current_user
    @membership.save

    respond_to do |format|
      if @membership.save
        Rails.logger.debug " ***\n Membership saved in memberships controller.\n ***"
        format.html { redirect_to current_user }
        format.json { render json: @membership, status: :created, location: @membership }
      else
        format.html { render action: "new" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /memberships/1
  # PUT /memberships/1.json
  def update
    @membership = Membership.find(params[:id])

    respond_to do |format|
      if @membership.update_attributes(params[:membership])
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end
end
