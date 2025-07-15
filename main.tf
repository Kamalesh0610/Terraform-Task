provider "aws" {
    region = "ap-south-1"
}
provider "aws" {
    region = "ap-northeast-3"
    alias = "northeast"
}
resource "aws_instance" "south_instance" {
    ami = "ami-0a1235697f4afa8a4"
    instance_type = "t2.micro"

    tags = {
        Name = "south-instance"
    }
}
resource "aws_instance" "northeast_insatance" {
    provider = aws.northeast
    ami = "ami-02db0d25104c5e62b"
    instance_type = "t2.micro"

    tags = {
        Name = "northeast-insatance"
    }
}
output "south_instance" {
    value = aws_instance.south_instance.public_ip
}
output "northeast_insatance" {
    value = aws_instance.northeast_insatance.public_ip
}