module PortalsHelper
	def list_portals(portals)
		list = portals.map do |p|
			tag.h1 link_to p.location, p
			# "Quest count: #{p.quests.count}"
		end
		list.join(" ")
	end

	def portal_link(p)
		link_to p.location, p
	end

end
