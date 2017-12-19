<%= form.label :limit, 'expired' %>
<%= form.select :limit, options_for_select(%w(15m 30m 1h 3h 6h 12h 24h)) %>

