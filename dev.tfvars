vpcs = {
  vpc_1 = {
    vpc_cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames     = true
    enable_dns_support       = true
    tags = {
      "Environment" = "production"
      "Project"     = "project-1"
    }
    private_subnet_map = {
      subnet_1 = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-west-1a"
        tags = {
          "Name" = "private-subnet-1"
        }
      }
      subnet_2 = {
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-west-1b"
        tags = {
          "Name" = "private-subnet-2"
        }
      }
    }
    private_subnets = {
      subnet_1 = "10.0.1.0/24"
      subnet_2 = "10.0.2.0/24"
    }
    azs = ["us-west-1a", "us-west-1b"]
    all_private_subnet_ids = ["subnet-11111111", "subnet-22222222"]
    private_subnet_tags = {
      "Owner" = "team1"
    }
    private_subnet_list = [
      {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-west-1a"
        tags = {
          "Name" = "private-subnet-1"
        }
      },
      {
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-west-1b"
        tags = {
          "Name" = "private-subnet-2"
        }
      }
    ]
  },

  vpc_2 = {
    vpc_cidr_block           = "10.1.0.0/16"
    enable_dns_hostnames     = true
    enable_dns_support       = true
    tags = {
      "Environment" = "staging"
      "Project"     = "project-2"
    }
    private_subnet_map = {
      subnet_1 = {
        cidr_block = "10.1.1.0/24"
        availability_zone = "us-west-2a"
        tags = {
          "Name" = "private-subnet-3"
        }
      }
      subnet_2 = {
        cidr_block = "10.1.2.0/24"
        availability_zone = "us-west-2b"
        tags = {
          "Name" = "private-subnet-4"
        }
      }
    }
    private_subnets = {
      subnet_1 = "10.1.1.0/24"
      subnet_2 = "10.1.2.0/24"
    }
    azs = ["us-west-2a", "us-west-2b"]
    all_private_subnet_ids = ["subnet-33333333", "subnet-44444444"]
    private_subnet_tags = {
      "Owner" = "team2"
    }
    private_subnet_list = [
      {
        cidr_block = "10.1.1.0/24"
        availability_zone = "us-west-2a"
        tags = {
          "Name" = "private-subnet-3"
        }
      },
      {
        cidr_block = "10.1.2.0/24"
        availability_zone = "us-west-2b"
        tags = {
          "Name" = "private-subnet-4"
        }
      }
    ]
  }
}