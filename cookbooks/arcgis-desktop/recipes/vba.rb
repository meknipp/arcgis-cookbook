

arcgis_desktop_vba 'Install ArcGIS Desktop VBA Compatibility' do
  setup node['arcgis']['vba']['setup']
  product_code node['arcgis']['vba']['product_code']
  not_if { Utils.product_installed?(node['arcgis']['vba']['product_code']) }
  action :install
end