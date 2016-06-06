defmodule PostFacto.RetrosControllerTest do
  use PostFacto.ConnCase

  test "POST /api/retros", %{conn: conn} do
    request_body = %{name: "My New Retro Week 1"} |> Poison.encode!

    response = conn
                |> put_req_header("accept", "application/json")
                |> put_req_header("content-type", "application/json")
                |> post("/api/retros", request_body)

    assert response.status == 201
    data = Poison.decode!(response.resp_body)
    assert data["data"]["name"] == "My New Retro Week 1"
  end
end
