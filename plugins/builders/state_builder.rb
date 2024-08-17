class Builders::StateBuilder < SiteBuilder
  def build
    hook :site, :post_read do
      site.data.states.each do |state|
        add_resource :states, "#{Bridgetown::Utils.slugify(state.State)}.md" do
          permalink "/states/#{Bridgetown::Utils.slugify(state.State)}/"
          layout :post
          # categories post[:taxonomy][:category].map { |category| category[:slug] }
          date Date.today.to_s
          content "hello #{state.State}"
        end
      end
    end
  end
end