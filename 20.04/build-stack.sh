dkbuild && dkpush && cd py3.7.2/base &&  dkbuild && dkpush && cd .. && dkbuild && dkpush && cd node && dkbuild && dkpush && cd tooled && dkbuild && dkpush && cd ../.. && cd ml &&   dkbuild && dkpush && cd tfx &&   dkbuild && dkpush && cdsdsodin && cd .. &&   dkbuild && dkpush && cd prod && . build-prod.sh && dkpush && . _env.sh && docker push $dockertag-jgi && echo "oh yeah, Strategist Virtualization is ready" || cd kada && echo "BAHHHH - Kada is Ready for Manual BUild decause dkbuilduser still has issues" 



