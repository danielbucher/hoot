module UsersHelper

  def edit_profile_link
    link_to "(Edit profile)", :edit_user_registration,
            class: "lnk-edit-profile"
  end
end
