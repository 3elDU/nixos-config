{ firefox-addons, _prefs, config, pkgs, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin.override {
      nativeMessagingHosts = [
        pkgs.tridactyl-native
      ];
    };

    profiles.default = {
      containersForce = true;
      containers = {
        default = {
          color = "toolbar";
          icon = "fingerprint";
          name = "Default";
          id = 0;
        };
        work = {
          color = "toolbar";
          icon = "briefcase";
          name = "Work";
          id = 1;
        };
        misc = {
          color = "toolbar";
          icon = "chill";
          name = "Misc";
          id = 2;
        };
      };

      extensions = with firefox-addons; [
        sidebery
        bitwarden
        ublock-origin
        privacy-badger
        sponsorblock
        dearrow
        multi-account-containers
        tridactyl
      ];

      search = {
        force = true;
        default = "DuckDuckGo";
        privateDefault = "DuckDuckGo";
        engines = {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "type"; value = "packages"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];

            definedAliases = [ "@np" ];
          };
        };
      };

      userChrome = builtins.replaceStrings
        [
          "__PRIMARY_COLOR__"
          "__SECONDARY_COLOR__"
          "__BACKGROUND_COLOR__"
          "__BACKGROUND2_COLOR__"
          "__SURFACE_COLOR__"
          "__SURFACE1_COLOR__"
        ]
        [
          colors.${_prefs.primaryColor}
          colors.${_prefs.secondaryColor}
          colors.base01
          colors.base00
          colors.base02
          colors.base03
        ]
        (builtins.readFile ./firefox/userChrome.css);

      settings = {
        # Enable CSS customization
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # This is to allow extensions being managed externally by Nix
        "extensions.autoDisableScopes" = 0;

        # Disable activity stream
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";

        # Disable telemetry
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false;
        "beacon.enabled" = false;
        # Disable studies
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        # Disable crash reports
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;

        # Disable safe browsing related stuff
        "browser.safebrowsing.malware.enabled" = false;
        "browser.safebrowsing.phishing.enabled" = false;
        "browser.safebrowsing.blockedURIs.enabled" = false;
        "browser.safebrowsing.provider.google4.gethashURL" = "";
        "browser.safebrowsing.provider.google4.updateURL" = "";
        "browser.safebrowsing.provider.google.gethashURL" = "";
        "browser.safebrowsing.provider.google.updateURL" = "";
        "browser.safebrowsing.provider.google4.dataSharingURL" = "";
        "browser.safebrowsing.downloads.enabled" = false;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "browser.safebrowsing.downloads.remote.url" = "";
        "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
        "browser.safebrowsing.downloads.remote.block_uncommon" = false;
        "browser.safebrowsing.allowOverride" = false;

        # Show punycode in URLs
        "network.IDN_show_punycode" = true;

        # Show full URLs
        "browser.urlbar.trimURLs" = false;

        # Disable form autofill
        "browser.formfill.enable" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.available" = "off";
        "extensions.formautofill.creditCards.available" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "extensions.formautofill.heuristics.enabled" = false;

        # Disable location bar contextual suggestions
        "browser.urlbar.quicksuggest.scenario" = "history";
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;

        # Do not save history, but save cookies
        "places.history.enabled" = false;
        "privacy.history.custom" = true;
        "privacy.clearOnShutdown_v2.cache" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "privacy.sanitize.sanitizeOnShutdown" = true;

        # Do not save passwords
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "signon.formlessCapture.enabled" = false;

        # Strict tracking protection
        "browser.contentblocking.category" = "strict";

        # Disable pocket extension
        "extensions.pocket.enabled" = false;

        # Enable containers and show the UI settings
        "privacy.userContext.enabled" = true;

        # Resist fingerprinting
        "privacy.resistFingerprinting" = true;

        # Do not save search engines to the config
        "browser.search.update" = false;

        # Enable hardware video decoding
        "media.ffmpeg.vaapi.enabled" = true;

        # Enable WebRender (https://wiki.mozilla.org/Platform/GFX/Quantum_Render)
        "gfx.webrender.all" = true;

        # Restore previous tabs on startup
        "browser.startup.page" = 3;

        # Disable feature tour on first startup
        "browser.uitour.enabled" = false;
      };
    };
  };
}
