Flow.new
    .when_falsy { user_allowed? }.dam { errors }
    .when_falsy { user.save }.dam { user.errors }
    .when_falsy { profile.save }.dam { profile.errors }
    .chain      { render_success }
    .on_dam     { |error_pool| render_errors(error_pool) }
