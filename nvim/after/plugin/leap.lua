local present = pcall(require, "leap")
if not present then return end

-- LEAP'S DEFAULT MAPPINGS
require('leap').add_default_mappings()
