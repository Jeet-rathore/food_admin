import 'package:flutter/material.dart';

// Common Header Widget used in both screens
class CommonHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? additionalAction;

  const CommonHeader({
    super.key,
    required this.title,
    required this.icon,
    this.additionalAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: Colors.grey[600]),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (additionalAction != null) ...[
                const SizedBox(width: 16),
                additionalAction!,
              ],
            ],
          ),
          Row(
            children: [
              Container(
                width: 250,
                height: 36,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[400],
                      size: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Icon(Icons.refresh, color: Colors.grey[600], size: 20),
              const SizedBox(width: 16),
              Icon(
                Icons.notifications_outlined,
                color: Colors.grey[600],
                size: 20,
              ),
              const SizedBox(width: 16),
              const UserProfileWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

// User Profile Widget (common in both screens)
class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pavan',
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Manager',
              style: TextStyle(fontSize: 10, color: Colors.grey[500]),
            ),
          ],
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.blue[100],
          child: Icon(Icons.person, size: 16, color: Colors.blue[700]),
        ),
      ],
    );
  }
}

// Common Pagination Widget
class PaginationWidget extends StatelessWidget {
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;
  final bool canGoNext;
  final bool canGoPrevious;

  const PaginationWidget({
    super.key,
    this.onPrevious,
    this.onNext,
    this.canGoNext = true,
    this.canGoPrevious = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: canGoPrevious ? onPrevious : null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.chevron_left,
                      size: 18,
                      color: canGoPrevious ? Colors.black : Colors.grey,
                    ),
                    Text(
                      'Previous',
                      style: TextStyle(
                        fontSize: 14,
                        color: canGoPrevious ? Colors.black : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: canGoNext ? onNext : null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 14,
                        color: canGoNext ? Colors.black : Colors.grey,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: canGoNext ? Colors.black : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Common Table Controls Widget
class TableControlsWidget extends StatelessWidget {
  final int entriesPerPage;
  final Function(int) onEntriesChanged;
  final Widget? additionalControls;

  const TableControlsWidget({
    super.key,
    required this.entriesPerPage,
    required this.onEntriesChanged,
    this.additionalControls,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Show',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<int>(
                value: entriesPerPage,
                underline: const SizedBox(),
                isDense: true,
                items:
                    [10, 25, 50, 100].map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                onChanged: (newValue) {
                  if (newValue != null) {
                    onEntriesChanged(newValue);
                  }
                },
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Records',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
        if (additionalControls != null) additionalControls!,
      ],
    );
  }
}

// Common Status Widget
class StatusWidget extends StatelessWidget {
  final bool isActive;

  const StatusWidget({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? Colors.white : Colors.grey[600],
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 3),
          Flexible(
            child: Text(
              isActive ? 'Active' : 'Inactive',
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[600],
                fontSize: 10,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// Common Action Buttons Widget
class ActionButtonsWidget extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ActionButtonsWidget({
    super.key,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: onEdit,
          child: Container(
            padding: const EdgeInsets.all(4),
            child: const Icon(Icons.edit, size: 16, color: Colors.blue),
          ),
        ),
        const SizedBox(width: 4),
        InkWell(
          onTap: onDelete,
          child: Container(
            padding: const EdgeInsets.all(4),
            child: const Icon(Icons.delete, size: 16, color: Colors.red),
          ),
        ),
      ],
    );
  }
}

// Common Profile Avatar Widget
class ProfileAvatarWidget extends StatelessWidget {
  final String name;
  final String? initial;

  const ProfileAvatarWidget({super.key, required this.name, this.initial});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: Colors.blue[100],
          child: Text(
            initial ?? name.substring(0, 1).toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.blue[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            name,
            style: const TextStyle(fontSize: 13),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
