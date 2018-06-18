

arcgis_desktop_vba 'Install ArcGIS Desktop VBA Compatibility' do
  setup node['arcgis']['vba']['setup']
  not_if { Utils.product_installed?(node['arcgis']['vba']['product_code']) }
  action :install
end

arcgis_desktop_vba 'Install ArcGIS Desktop VBA Compatibility VBAOF11' do
  vbaof11 node['arcgis']['vba']['vbaof11']
  not_if { Utils.product_installed?(node['arcgis']['vba']['vbaof11_product_code']) }
  action :installvbaof11
end

arcgis_desktop_vba 'Install ArcGIS Desktop VBA Compatibility VBAOF11i' do
  vbaof11i node['arcgis']['vba']['vbaof11i']
  not_if { Utils.product_installed?(node['arcgis']['vba']['vbaof11i_product_code']) }
  action :installvbaof11i
end