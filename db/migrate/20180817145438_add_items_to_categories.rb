class AddItemsToCategories < ActiveRecord::Migration[5.0]
  def change
   ["Air Quality", "Asbestos/Mould Abatement", "Interior Renovations/Design", "Automatic Door Service",
   "Irrigation", "Building Automation", "Janitorial", "Building Restoration", "Landscape/Site Work", "Carpet & Tile",
   "Caulking Lighting", "Communications/Network", "Marble/Granite Restoration", "Concrete Cutting & Coring","Locksmith",
   "Demolition Masonry","Restoration","Design/Build Metal Work","Dock Levellers","Electrical Overhead/Rolling Doors",
   "Electronic Repair","Elevator/Escalator","Emergency Generator","Emergency Lighting","Energy Conservation","Exterior Doors",
   "Exterior Walls/Foundation","Promotional Events","Fencing","Fire Restoration","Flooring","General Contractor Signage",
   "Glass/Mirrors","Handicap Accessibility","High Voltage","HVAC/Mechanical","Infrared Technology","Life Safety/Fire Protection","Manpower",
   "Operable Wall Partitions","Paint Contractor","Parking","Management/Equipment","Pest Control","Plumbing","Portable Moving","Power Sweeping/Line Painting",
   "Roofing","Security","Security Systems","Snow Removal","Soil Remediation","Waste Disposal","Window Cleaning","Window Coverings","Window Replacement/Glazing",
   "Other"].each do |item|
      Category.create(name: item, position: 0, active: true)
   end
  end
end
