class AssignmentsController < ApplicationController
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  #GET/ASSIGNMENTS
  def index
    @assignments = Assignment.all
  end

  def show
  end

  def new
    @assignment = Assignment.new
  end

  def edit
  end

  #POST

  def create
    @assignment = Assignment.new(assignment_params)
     if @assignment.save

       redirect_to @assignment, notice: "Assignment was created successfully!"
     else
       render :new
     end
   end #create

#PATCH
   def update
     if @assignment.update(assignment_params)

       redirect_to @assignment, notice: "Assignment updated successfully!"
     else
       render :edit
     end
   end #update

   #DELETE

   def destroy
     @assignment.destroy

     redirect_to root_path, notice: "Assignment was deleted successfully!"
   end #destroy

   private
#STRONG PARAMS
   def set_assignment
     @assignment = Assignment.find(params[:id])
   end

   def assignment_params
     params.require(:assignment).permit(:title)
   end

end#class
