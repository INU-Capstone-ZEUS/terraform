# # BASION EIP 
# resource "aws_eip" "bastion-eip" {
#   tags = {
#     "Name" = "bastion-eip"
#   }
# }

# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.bastion.id
#   allocation_id = aws_eip.bastion-eip.id
# }