class Skidfuscator < Formula
    desc "A JVM-based obfuscation suite designed for Java and Android bytecode"
    homepage "https://github.com/skidfuscatordev/skidfuscator-java-obfuscator"
    url "https://github.com/skidfuscatordev/skidfuscator-java-obfuscator/releases/download/2.0.11/skidfuscator.jar"

    sha256 "8d5bc1f6854995495a8451417cf5235a31a56d20fc4ce6079b19963ed84c49d9"
    version "2.0.11"
    license "MIT" # or the appropriate license for Skidfuscator
  
    def install
      # Install the JAR into libexec
      libexec.install Dir["*.jar"]
      jar_name = Dir["#{libexec}/*.jar"].first
      # Create a wrapper executable
      (bin/"skidfuscator").write <<~EOS
        #!/usr/bin/env bash
        exec java -jar "#{jar_name}" "$@"
      EOS
      (bin/"skidfuscator").chmod 0755
    end
  
    test do
      # Test that the command runs and shows a usage message
      output = shell_output("#{bin}/skidfuscator --help", 0)
      assert_match "Usage", output
    end
  end
  