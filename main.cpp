#include "boost/program_options.hpp"
#include <iostream>
#include "version.h"

namespace po = boost::program_options;

int main(int argc, char *argv[]) {
  po::options_description description("List of parameters");
  description.add_options()("help", "Help message")(
      "compression", po::value<int>(), "Set a compression level");

  po::variables_map values;
  po::store(po::parse_command_line(argc, argv, description), values);
  po::notify(values);

  if (values.count("help")) {
    std::cout << description << "\n";
    return 1;
  }

  if (values.count("compression")) {
    std::cout << "Compression level was set to "
              << values["compression"].as<int>() << ".\n";
  } else {
    std::cout << "Compression level was not set.\n";
  }

    std::cout << "Version: " << PROJECT_VERSION_MAJOR << "." << PROJECT_VERSION_MINOR << "." << PROJECT_VERSION_PATCH << "\n";

}
