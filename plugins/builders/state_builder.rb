class Builders::StateBuilder < SiteBuilder
  def build
    hook :site, :post_read do
      site.data.states.each do |state|
        add_resource :states, "#{Bridgetown::Utils.slugify(state.State)}.html" do
          permalink "/states/#{Bridgetown::Utils.slugify(state.State)}/"
          layout :default
          categories "states"
          date Date.today.to_s
          title state.State
          content <<-HTML
            <h1>#{state.State}</h1>
            <table>
            <thead>
            <tr>
            <th>County</th>
            <th>State</th>
            <th>Population</th>
            </tr>
            </thead>
            <tbody>
            <% site.data.uscounties.select {|county| county.state_id == "#{state.Abbreviation}" }.each do |county| %>
                <tr>
                <td><%= county.county %></td>
                <td><%= county.state_id %></td>
                <td><%= county.population %></td>
                </tr>
            <% end %>
            </tbody>
            </table>
          HTML
        end
      end
    end
  end
end