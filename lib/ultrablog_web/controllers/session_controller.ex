defmodule UltrablogWeb.SessionController do
  use UltrablogWeb, :controller

  alias Ultrablog.Accounts
  alias Ultrablog.Accounts.User

  def create(conn, %{"email" => email}) do
    user = Accounts.get_user_by_email(email)
    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Welcome back #{user.name}!")
      |> redirect(to: "/main")
    else
      conn
      |> put_flash(:error, "Wrong Email Address. Can't create session.")
      |> redirect(to: page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    # |> configure_session(drop: true)

    conn
    |> delete_session(:user_id)
    |> put_flash(:success, "You have successfully Logged out!")
    |> redirect(to: page_path(conn, :index))
  end
end
