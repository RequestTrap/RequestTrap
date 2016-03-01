class NewRequest

  def initialize(trap_id, request, response)
    @request_obj = Request.new(trap_id: trap_id)
    @request = request
    @response = response
  end

  def create
    request_obj.remote_ip = request.remote_ip
    request_obj.request_method = request.request_method
    request_obj.scheme = request.scheme
    request_obj.query_string = request.query_string
    request_obj.query_params = request.query_params
    request_obj.cookies = request.cookies
    request_obj.headers = request.headers
    request_obj.raw_response = response.body
    request_obj.save
  end

  private

  attr_reader :request_obj, :request, :response

end
