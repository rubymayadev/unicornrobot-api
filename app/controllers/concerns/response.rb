module Response
  def json_response(object, serializer, status = :ok)
    render json: object, serializer: serializer, status: status
  end
end
