data "aws_availability_zones" "azs" {
  
}

resource "aws_vpc" "mk-demo02" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "mk-vpc-test102-mk"
  }
}

resource "aws_subnet" "mk-subnet-demo101-public" {
     count = length(data.aws_availability_zones.azs.names)
  depends_on              = [aws_vpc.mk-demo02]
  vpc_id                  = aws_vpc.mk-demo02.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.${count.index+1}.0/24"
  availability_zone       = data.aws_availability_zones.azs.names[count.index]
  tags = {
    Name = "subnet-mk-public-2-mk-${count.index+1}"
  }

}