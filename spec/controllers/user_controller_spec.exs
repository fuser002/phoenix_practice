defmodule PhoenixPractice.UserControllerSpec do
  use ESpec.Phoenix, controller: PhoenixPractice.UserController
  alias PhoenixPractice.User

  context "Response" do
    it "index" do
      Repo.insert(%User{id: 1, name: "yhoshino11"})
      user = Repo.get!(User, 1)
      res_conn = action(:index, %{})
      expect(res_conn).to be_successful
      expect(res_conn).to have_in_assigns(users: [user])
      expect(res_conn).to render_template("index.html")
    end

    it "show" do
      Repo.insert(%User{id: 1, name: "yhoshino11"})
      user = Repo.get!(User, 1)
      res_conn = action(:show, %{"id" => 1})
      expect(res_conn).to be_successful
      expect(res_conn).to have_in_assigns(user: user)
      expect(res_conn).to render_template("show.html")
    end

    it "new" do
      changeset = User.changeset(%User{})
      res_conn = action(:new, %{})
      expect(res_conn).to be_successful
      expect(res_conn).to have_in_assigns(changeset: changeset)
      expect(res_conn).to render_template("new.html")
    end

    it "create" do
      res_conn = action(:create, %{"user" => %{name: "yhoshino11"}})
      expect(res_conn).to redirect_to(user_path(conn, :index))
    end
  end
end
