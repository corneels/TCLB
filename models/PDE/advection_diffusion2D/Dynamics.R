# Model for solving the convection-diffusion equation:
# phi' = c * lap(phi) - U * grad(phi)
# phi' = c * (phi_xx + phi_yy) - [ux,uy] * [phi_x,phi_y]


# Fields are variables (for instance flow-variables, displacements, etc) that are stored in all mesh nodes. 
# Model Dynamics can access these fields with an offset (e.g. field_name(-1,0)).
AddField(name="phi", dx=c(-1,1), dy=c(-1,1)) # same as AddField(name="phi", stencil2d=1)

# 	Outputs:
AddQuantity(name="Phi")

#	Inputs: Flow Properties
AddSetting(name="diff_coeff")
AddSetting(name="Value", zonal=TRUE)
AddSetting(name="ux", comment="free stream velocity")
AddSetting(name="uy", comment="free stream velocity")

#	Boundary things:
AddNodeType(name="Dirichlet", group="BOUNDARY")
