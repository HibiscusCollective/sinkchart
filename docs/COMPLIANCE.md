# AGPLv3 Compliance Guide

## Overview

SinkChart is licensed under the GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later). This document explains what this means for users, contributors, and those who wish to deploy SinkChart.

## What is AGPLv3?

The AGPL-3.0 is a strong copyleft license that extends the GPL-3.0 to cover network use. It ensures that software freedom is preserved even when software is used as a service.

## Key Requirements

### 1. Source Code Availability

- **All users must have access to the source code**
- **Network users must be able to download the source**
- **Modifications must be made available under the same license**

### 2. Network Use Clause (Section 13)

If you run SinkChart on a server and allow others to interact with it over a network, you must:
- Provide a way for users to download the complete source code
- Include any modifications you've made
- Make it easily accessible (typically via download link)

### 3. License Compatibility

SinkChart can include:
- ✅ AGPLv3 licensed code
- ✅ GPLv3 licensed code  
- ✅ GPLv2 licensed code (if compatible)
- ✅ MIT, BSD, Apache 2.0 licensed code
- ❌ Proprietary code (without permission)

## For Users

### Using SinkChart

You can:
- ✅ Use SinkChart for any purpose (personal, commercial, etc.)
- ✅ Modify the software for your needs
- ✅ Share copies with others
- ✅ Charge for support or services

### Running SinkChart as a Service

If you provide SinkChart as a service to others:
- 🔴 **Required**: Provide source code download to all users
- 🔴 **Required**: Include all modifications you've made
- 🔴 **Required**: Use AGPLv3 for any derivative work

## For Contributors

### Contributing Code

By contributing to SinkChart, you must:
- Sign off commits with Developer Certificate of Origin (DCO)
- Ensure your code is compatible with AGPLv3
- Grant rights to use your contribution under AGPLv3

### Contribution Process

1. Fork the repository
2. Make your changes
3. Sign off commits: `git commit -s`
4. Submit a pull request

## For Distributors

### Distributing SinkChart

When distributing SinkChart:
- Include the LICENSE file
- Include the source code or provide access to it
- Keep all copyright notices intact
- Document any modifications made

### Commercial Distribution

You can:
- Sell SinkChart as part of a commercial product
- Charge for support, training, or customization
- Must still provide source code to recipients
- Must use AGPLv3 for derivative works

## Common Scenarios

### Scenario 1: Personal Use
**Question**: Can I use SinkChart for personal gaming?
**Answer**: Yes, absolutely. No restrictions on personal use.

### Scenario 2: Company Internal Use
**Question**: Can my company use SinkChart internally?
**Answer**: Yes, with no additional obligations if not providing as a service to others.

### Scenario 3: SaaS Deployment
**Question**: Can I offer SinkChart as a web service?
**Answer**: Yes, but you must provide source code download to all users.

### Scenario 4: Mobile App Store
**Question**: Can I distribute SinkChart on app stores?
**Answer**: Yes, but source code must be available and app store terms must be compatible.

## Compliance Checklist

### For Service Providers

- [ ] Source code download prominently displayed
- [ ] All modifications included in source release
- [ ] AGPLv3 license included
- [ ] Copyright notices preserved
- [ ] User notification of their rights

### For Distributors

- [ ] LICENSE file included
- [ ] Source code available
- [ ] Build instructions provided
- [ ] Dependencies documented
- [ ] Copyright notices intact

## Getting Help

If you have questions about AGPLv3 compliance:
- Read the full license text in the LICENSE file
- Consult with a qualified legal professional
- Contact the project maintainers for clarification
- Review the FSF's AGPLv3 FAQ

## Resources

- [AGPLv3 License Text](../LICENSE)
- [GNU Project AGPLv3 FAQ](https://www.gnu.org/licenses/gpl-faq.html)
- [Free Software Foundation](https://www.fsf.org/)
- [Project Repository](https://github.com/HibiscusCollective/sinkchart)

---

**Disclaimer**: This guide is for informational purposes only and does not constitute legal advice. For specific legal questions, consult with a qualified attorney.