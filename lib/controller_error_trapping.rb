
module ControllerErrorTrapping

  def self.included(base)
    include ErrorTrapping

    base.extend(ClassMethods)
  end

  protected
    def catch_403(exception=nil)
      log_error(exception)

      respond_to do |format|
        format.html { render :template => 'errors/error_403', :status => 404 }
      end
    end

    def catch_404(exception=nil)
      log_error(exception)

      respond_to do |format|
        format.html { render :template => 'errors/error_404', :status => 404 }
      end
    end


    def catch_500(exception=nil)
      log_error(exception)

      respond_to do |format|
        format.html { render :template => 'errors/error_500', :status => 500 }
      end
    end


    def log_error(exception)
      @e = env["action_dispatch.exception"]
      puts "HI IM AN ERROR"
      if exception.blank?
        logger.error @e
      else
        logger.error exception.message
        logger.error Rails.backtrace_cleaner.clean(exception.backtrace).join("\n")
      end
    end



  module ClassMethods

    def setup_controller_errors
      # must be first otherwise the others will not fire.
      rescue_from Exception, :with => :catch_500

      rescue_from CanCan::AccessDenied, :with => :catch_403
      rescue_from ActionController::RoutingError, :with => :catch_404
      rescue_from ActionController::UnknownController, :with => :catch_404
      rescue_from AbstractController::ActionNotFound, :with => :catch_404
      rescue_from ActiveRecord::RecordNotFound, :with => :catch_404
    end
  end
end
