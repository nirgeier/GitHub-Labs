# Teams & Permissions

- This guide covers team management and access control in GitHub organizations.
- You'll learn to create teams, manage permissions, and implement secure collaboration workflows.

---

## 1. Teams Overview

!!! tip "Teams Benefits"

    GitHub Teams provide structured access control and collaboration:

    - **Organized Access**: Group users for repository permissions
    - **Scalable Management**: Manage permissions at team level
    - **Communication**: @mention entire teams in discussions
    - **Code Review**: Assign teams as reviewers
    - **Visibility Control**: Public or secret team visibility
    - **Nested Structure**: Create parent-child team hierarchies
    - **Cross-Repository**: Manage access across multiple repositories
    - **Audit Trail**: Track team membership and permission changes

---

## 2. Repository Permission Levels

### 2.1. Individual Permissions

**Read (Pull)**

- View and clone repository
- Download releases and packages
- Open and comment on issues
- Submit pull requests
- View wiki pages

**Triage**

- Read permissions, plus:
- Manage issues and pull requests
- Apply labels and assign users
- Close, reopen, and assign issues
- Request pull request reviews

**Write (Push)**

- Triage permissions, plus:
- Push to repository branches
- Create, edit, and delete files
- Merge pull requests
- Manage wiki pages
- Edit repository description

**Maintain**

- Write permissions, plus:
- Manage repository settings
- Add collaborators
- Manage branch protection rules
- Create and manage releases

**Admin**

- All permissions, plus:
- Delete repository
- Manage security settings
- Transfer repository ownership
- Configure advanced security features

### 2.2. Organization Permissions

**Outside Collaborators**

- Not organization members
- Limited to specific repositories
- Cannot see organization teams
- Reduced metadata access

**Organization Members**

- Basic organization membership
- Can see public teams
- Access to organization resources
- Default repository permissions

**Organization Owners**

- Complete administrative access
- Manage all repositories
- Create and manage teams
- Configure organization settings

---

## 3. Creating and Managing Teams

### 3.1. Team Creation

1. Go to organization **"Teams"** tab
2. Click **"New team"**
3. Configure team settings:
   - **Team name**: Descriptive identifier
   - **Description**: Team purpose and scope
   - **Visibility**: Public or Secret
   - **Parent team**: Optional hierarchy

### 3.2. Team Visibility

**Public Teams**

- Visible to all organization members
- Members can be seen by everyone
- Suitable for open collaboration
- Default for most teams

**Secret Teams**

- Only visible to team members
- Hidden from other organization members
- Used for sensitive projects
- Administrative or security teams

### 3.3. Team Hierarchy

**Parent Teams**

    Development Team (Parent)
    ├── Frontend Team
    ├── Backend Team
    ├── DevOps Team
    └── QA Team

**Benefits of Hierarchy**

- Inherit parent team permissions
- Simplified permission management
- Organizational structure reflection
- Easier team coordination

---

## 4. Repository Access Management

### 4.1. Team Repository Access

**Granting Access**

1. Navigate to repository **"Settings"** → **"Manage access"**
2. Click **"Invite teams or people"**
3. Search for team name
4. Select permission level
5. Click **"Add to repository"**

**Permission Levels**

- Assign appropriate access level
- Consider principle of least privilege
- Regular permission audits
- Document access decisions

### 4.2. Repository Settings

**Default Permissions**

- Set organization-wide defaults
- New repository inheritance
- Member base permissions
- Outside collaborator limits

**Repository Creation**

- Control who can create repositories
- Limit repository types
- Naming conventions
- Default visibility settings

### 4.3. Branch Protection

**Team-Based Protection**

- Require team reviews
- Dismiss stale team reviews
- Code owner review requirements
- Status check enforcement

---

## 5. Advanced Team Features

### 5.1. Code Review Assignment

**Team Review Requests**

- Automatically assign teams
- Round-robin assignment
- Load balancing algorithms
- Expertise-based assignment

**CODEOWNERS Integration**

    # Team ownership patterns
    * @org/team-leads
    /frontend/ @org/frontend-team
    /backend/ @org/backend-team
    *.md @org/documentation-team

### 5.2. Team Synchronization

**LDAP Integration**

- Sync with enterprise directory
- Automatic membership updates
- Group-based team creation
- Centralized user management

**SAML Integration**

- Single sign-on authentication
- Team mapping from IdP
- Automated provisioning
- Security compliance

### 5.3. Team Discussions

**Communication Channels**

- Team-specific discussions
- Private team conversations
- Announcements and updates
- Knowledge sharing

---

## 6. Security and Compliance

### 6.1. Access Reviews

**Regular Audits**

- Monthly access reviews
- Remove inactive members
- Validate team permissions
- Document access decisions

**Automated Monitoring**

- Track permission changes
- Alert on suspicious activity
- Log access patterns
- Compliance reporting

### 6.2. Security Policies

**Organization Security**

- Two-factor authentication requirements
- IP address restrictions
- SSH key management
- App access policies

**Repository Security**

- Branch protection rules
- Required status checks
- Vulnerability scanning
- Dependency management

### 6.3. Compliance Management

**Audit Logs**

- Access permission changes
- Team membership modifications
- Repository setting updates
- Security event tracking

**Data Protection**

- Personal data handling
- Export controls compliance
- Geographic restrictions
- Privacy policy adherence

---

## 7. Best Practices

!!! success "Team Management Best Practices"

    **Organization**

      - Use clear, descriptive team names
      - Document team purposes and responsibilities
      - Create logical team hierarchies
      - Regular team structure reviews

    **Security**

      - Follow principle of least privilege
      - Regular access audits
      - Enable two-factor authentication
      - Monitor team membership changes

    **Collaboration**

      - Use teams for code review assignments
      - Implement CODEOWNERS patterns
      - Foster team communication
      - Share knowledge across teams

    **Governance**

      - Establish team creation policies
      - Document permission standards
      - Implement approval workflows
      - Maintain compliance records

---

## Summary

You now understand how to:

&emsp;&emsp;✅&emsp;Create and configure GitHub teams effectively  
&emsp;&emsp;✅&emsp;Manage repository permissions and access control  
&emsp;&emsp;✅&emsp;Implement team hierarchies and organization  
&emsp;&emsp;✅&emsp;Use teams for code review and collaboration  
&emsp;&emsp;✅&emsp;Apply security best practices and compliance  
&emsp;&emsp;✅&emsp;Monitor and audit team access regularly  
