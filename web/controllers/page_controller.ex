defmodule Deployable.PageController do
  use Deployable.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def who(conn, _params) do
    render conn, "who.html"
  end

  def status(conn, _params) do
    text conn, "OK"
  end
end
