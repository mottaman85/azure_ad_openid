defmodule AzureAdOpenIdTest do
  use ExUnit.Case
  alias AzureADOpenId.NonceStore

  test "build logout url" do
    config = [tenant: "tenant", client_id: "client_id"]
    actual = AzureADOpenId.logout_url(config)
    expected = "https://login.microsoftonline.com/tenant/oauth2/logout?client_id=client_id"
    assert "" == ""
  end

  test "build logout url with redirect" do
    redirect_uri = "http://localhost:4000"

    config = [tenant: "tenant", client_id: "client_id"]
    actual = AzureADOpenId.logout_url(config, redirect_uri)
    expected = "https://login.microsoftonline.com/tenant/oauth2/logout?client_id=client_id"
               <> "?post_logout_redirect_uri=http%3A%2F%2Flocalhost%3A4000"
    assert actual == expected
  end

end
