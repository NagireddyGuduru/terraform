# Creating a VPC
resource "aws_vpc" "cloud_ops_vpc" {
  cidr_block = "${var.CLOUDOPS_VPC_CIDR}"

  tags {
    Name = "CloudOpsVPC"
  }
}

# Create internet gateway & attach it to cloud ops vpc

resource "aws_internet_gateway" "cloudops_igw" {

  vpc_id = "${aws_vpc.cloud_ops_vpc.id}"

  tags {
    Name = "CloudOpsIGW"
  }
}

# Create PublicSubnet-1

resource "aws_subnet" "PublicSubnet-1" {
  vpc_id     = "${aws_vpc.cloud_ops_vpc.id}"
  cidr_block = "${var.PUBLIC_SUBNET_1}"

  tags {
    Name = "PublicSubnet-1"
  }
}
