module AlpnBootJruby

  module_function

  def jar_version_for_jdk
    runtime = Java::JavaLang::System.getProperties["java.runtime.version"]
    runtime = /\A\d\.\d\.\d+_\d+/.match(runtime)[0].sub("_", "u")

    case runtime
      when "1.7.0u40", "1.7.0u45", "1.7.0u51", "1.7.0u55", "1.7.0u60", "1.7.0u65", "1.7.0u67"
        "7.1.0.v20141016"
      when "1.7.0u71", "1.7.0u72"
        "7.1.2.v20141202"
      when "1.7.0u75", "1.7.0u76", "1.7.0u79", "1.7.0u80"
        "7.1.3.v20150130"
      when "1.8.0", "1.8.0u05", "1.8.0u11", "1.8.0u20"
        "8.1.0.v20141016"
      when "1.8.0u25"
        "8.1.2.v20141202"
      when "1.8.0u31", "1.8.0u40", "1.8.0u45"
        "8.1.3.v20150130"
      when "1.8.0u51"
        "8.1.4.v20150727"
      when "1.8.0u60"
        "8.1.5.v20150921"
      when "1.8.0u65", "1.8.0u66"
        "8.1.6.v20151105"
      when "1.8.0u71", "1.8.0u72", "1.8.0u73", "1.8.0u74", "1.8.0u77", "1.8.0u91"
        "8.1.7.v20160121"
      when "1.8.0u92", "1.8.0u101", "1.8.0u102"
        "8.1.9.v20160720"
      else
        raise "Unknown Java version - cannot find appropriate jar."
    end
  end

  VERSION = "8.1.9.v20160720"
  JAR_VERSION = jar_version_for_jdk

end
